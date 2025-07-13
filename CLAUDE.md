# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## リポジトリ概要

個人のdotfilesリポジトリ。各種設定ファイルとそれらをホームディレクトリにシンボリックリンクするスクリプトを管理。

## セットアップコマンド

```sh
cd ~
git clone git@github.com:seigow/dotfiles.git
sh ~/dotfiles/dotfilesLink.sh
```

## ファイル構成

- `dotfilesLink.sh` - 設定ファイルをホームディレクトリにリンクするメインスクリプト
- `gitconfig` - Gitの設定（エディタ、エイリアス等）
- `vimrc` - Vimエディタの詳細設定
- `zshrc` - Zshシェルの設定（現在は空）

## 開発時の注意点

- 新しい設定ファイルを追加する際は、`dotfilesLink.sh`にシンボリックリンク作成コマンドを追加
- 設定の変更後は実際にリンクが正しく動作することを確認
- 既存の設定ファイルが上書きされないよう注意