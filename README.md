# Reticulum for Windows

## 必要環境

### PostgreSQL (recommended version 11.x):

Windows: https://www.postgresql.org/download/windows/

### Erlang (v23.3) + Elixir (v1.14) + Phoenix

https://elixir-lang.org/install.html

Note: On Linux, you may also have to install the erlang-src package for your distribution in order to compile dependencies successfully.

https://hexdocs.pm/phoenix/installation.html |

## 初期設定

### セットアップ

`mix deps.get`

### 証明書を生成

`mix certs.gen`

鍵 key.pem と証明書 cert.pem が、priv/certs の中に生成されます。

## 起動

`.\scripts\run-reticulum-local.ps1`
