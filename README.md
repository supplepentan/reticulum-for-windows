# Reticulum for Windows

## 必要環境

### PostgreSQL (recommended version 11.x):

Windows: https://www.postgresql.org/download/windows/

### Erlang (v23.3) + Elixir (v1.14) + Phoenix

https://elixir-lang.org/install.html

Note: On Linux, you may also have to install the erlang-src package for your distribution in order to compile dependencies successfully.

https://hexdocs.pm/phoenix/installation.html |

## 初期設定

### 必要なパッケージをインストールする

`mix deps.get`

### PostgreSQL にデータベースを作成

`mix ecto.create`

### 証明書を生成（既存のものを使う場合は、省略してください。）

`mix certs.gen`

鍵 key.pem と証明書 cert.pem が、priv/certs の中に生成されます。

### scripts/run-reticulum-local.ps1 の key 内容を変更（既存のものを使う場合は、省略してください。）

perms.pub.pem の内容を書き込みます。

`$env:PERMS_KEY = @"
-----BEGIN PUBLIC KEY-----...perms.pub.pem の内容を 1 行にして貼り付けてください。...-----END PUBLIC KEY-----
"@`

## 起動

`.\scripts\run-reticulum-local.ps1`
