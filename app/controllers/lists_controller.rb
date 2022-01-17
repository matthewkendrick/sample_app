class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    #データを受け取り、新規登録するためのインスタンスを作成する
    list = List.new(list_params)

    #データをデータベースに保存するためのsaveメソッドを実行する
    list.save

    #トップ画面へリダイレクトさせる
    redirect_to '/top'
  end

  def index
  end

  def show
  end

  def edit
  end

  private
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
