class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    #データを受け取り、新規登録するためのインスタンスを作成する
    list = List.new(list_params)

    #データをデータベースに保存するためのsaveメソッドを実行する
    list.save

    #詳細画面へリダイレクトする
    redirect_to list_path(list.id)
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end

  private
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
