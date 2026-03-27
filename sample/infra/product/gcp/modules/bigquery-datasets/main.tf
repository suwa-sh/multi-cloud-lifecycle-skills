# ==============================================================================
# BigQuery データセット群 — raw / staging / intermediate / mart
# ==============================================================================
#
# データレイク/ウェアハウスの 4 層構造を BigQuery データセットとして構成する。
# 環境分離はプロジェクトレベルで行うため、データセット名は環境を含まない。
#
# ==============================================================================

variable "project_id" {
  description = "GCP プロジェクト ID"
  type        = string
}

variable "environment" {
  description = "環境名"
  type        = string
}

variable "location" {
  description = "データセットロケーション"
  type        = string
}

variable "bu_list" {
  description = "ビジネスユニットのリスト"
  type        = list(string)
}

# ------------------------------------------------------------------------------
# ローカル変数
# ------------------------------------------------------------------------------

locals {
  # 共通ラベル
  common_labels = {
    cost-center = "data-analytics" # TODO: コストセンター名を設定すること
    environment = var.environment
    service     = "bigquery"
  }

  # raw データセットのテーブル有効期限（90 日 = 7,776,000,000 ミリ秒）
  raw_table_expiration_ms = 90 * 24 * 60 * 60 * 1000
}

# ------------------------------------------------------------------------------
# raw データセット — 生データ格納（テーブル有効期限 90 日）
# ------------------------------------------------------------------------------

resource "google_bigquery_dataset" "raw" {
  dataset_id  = "raw"
  project     = var.project_id
  location    = var.location
  description = "生データ格納用データセット。AWS / SaaS からの取り込みデータを保持する。テーブル有効期限 90 日。"

  default_table_expiration_ms = local.raw_table_expiration_ms

  labels = local.common_labels

  # TODO: データセットレベルの IAM を組織に合わせて調整すること
  access {
    role          = "WRITER"
    special_group = "projectWriters"
  }

  access {
    role          = "OWNER"
    special_group = "projectOwners"
  }

  access {
    role          = "READER"
    special_group = "projectReaders"
  }

  # TODO: dbt サービスアカウントに READER 権限を付与すること
  # access {
  #   role          = "READER"
  #   user_by_email = "dbt-runner@${var.project_id}.iam.gserviceaccount.com"
  # }
}

# ------------------------------------------------------------------------------
# staging データセット — dbt staging モデル（stg_*）
# ------------------------------------------------------------------------------

resource "google_bigquery_dataset" "staging" {
  dataset_id  = "staging"
  project     = var.project_id
  location    = var.location
  description = "dbt staging モデル格納用。raw データのクレンジング・型変換を行った中間テーブルを保持する。"

  labels = local.common_labels

  access {
    role          = "WRITER"
    special_group = "projectWriters"
  }

  access {
    role          = "OWNER"
    special_group = "projectOwners"
  }

  access {
    role          = "READER"
    special_group = "projectReaders"
  }
}

# ------------------------------------------------------------------------------
# intermediate データセット — dbt intermediate モデル（int_*）
# ------------------------------------------------------------------------------

resource "google_bigquery_dataset" "intermediate" {
  dataset_id  = "intermediate"
  project     = var.project_id
  location    = var.location
  description = "dbt intermediate モデル格納用。複数ソースの結合・集計を行ったビジネスロジックテーブルを保持する。"

  labels = local.common_labels

  access {
    role          = "WRITER"
    special_group = "projectWriters"
  }

  access {
    role          = "OWNER"
    special_group = "projectOwners"
  }

  access {
    role          = "READER"
    special_group = "projectReaders"
  }
}

# ------------------------------------------------------------------------------
# mart データセット — dbt mart モデル（mart_*）— BU 別に作成
# ------------------------------------------------------------------------------

resource "google_bigquery_dataset" "mart" {
  for_each = toset(var.bu_list)

  dataset_id  = "mart_${each.key}"
  project     = var.project_id
  location    = var.location
  description = "データマート（${each.key}）。Looker Studio / AMG から参照される最終テーブルを保持する。"

  labels = merge(local.common_labels, {
    business-unit = each.key
  })

  # TODO: BU 別の閲覧権限を IAM グループで制御すること
  access {
    role          = "WRITER"
    special_group = "projectWriters"
  }

  access {
    role          = "OWNER"
    special_group = "projectOwners"
  }

  access {
    role          = "READER"
    special_group = "projectReaders"
  }

  # TODO: BU の Google グループに READER 権限を付与すること
  # access {
  #   role          = "READER"
  #   group_by_email = "${each.key}-analysts@example.com"
  # }
}

# ------------------------------------------------------------------------------
# 出力
# ------------------------------------------------------------------------------

output "raw_dataset_id" {
  description = "raw データセット ID"
  value       = google_bigquery_dataset.raw.dataset_id
}

output "staging_dataset_id" {
  description = "staging データセット ID"
  value       = google_bigquery_dataset.staging.dataset_id
}

output "intermediate_dataset_id" {
  description = "intermediate データセット ID"
  value       = google_bigquery_dataset.intermediate.dataset_id
}

output "mart_dataset_id" {
  description = "mart データセット ID（BU 別マップ）"
  value       = { for k, v in google_bigquery_dataset.mart : k => v.dataset_id }
}
