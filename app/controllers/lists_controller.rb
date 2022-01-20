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
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to '/lists'
  end

  private
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end
