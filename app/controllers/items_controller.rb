class ItemsController < ApplicationController
  # 誰が出品したかわかるようにprivateに記載
  # before_action :set_user

  # 商品一覧表示
  def index
    # N+1問題を解消するためにincludesメソッドを使用（includesメソッドを使用するとすべてのレコードを取得するためallメソッドは省略可能）
    @items = Item.includes(:images).order("created_at DESC").limit(5)
  end

  # 商品出品ページへ遷移する処理
  def new
    # Itemモデルのインスタンスを生成(form_withで使用するためインスタンス変数が必要)
    @item = Item.new
    # @item.images.newにより、newアクションで定義されたItemクラスのインスタンスに関連づけられたImageクラスのインスタンスが作成される。
    @item.images.new
    # # ユーザーのすべての商品である@itemsを定義。「n+1問題」を避けるために、includes(:user)を記載。
    # @items = @user.items.includes(:user)
  end

  # 商品の保存
  def create
    @item = Item.new(item_params)
    # 商品の保存に成功した場合、保存に失敗した場合で処理を分岐
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  # 商品購入
  def purchase
  end

  # クラス外から呼び出すことのできないメソッド
  private

  # ストロングパラメーターを使って、指定したキーを持つパラメーターのみを受け取るように制限
  def item_params
    # fields_forを利用して作成されたフォームから来る値は、○○s_attributes: [:××]という形でparamsに入る。○○は関連付く側のモデルの名前、××にはフォームに対応するカラムの名前が入る。
    params.require(:item).permit(:name, :explain, :status_id, :delivery_fee, :region, :days, :price, :seller_id, :buyer_id, :auction_id, :category_id, brands_attributes: [:name], images_attributes: [:image]).merge(seller_id: current_user.id)
  end

  # itemsコントローラーの全てのアクションで@userを利用できる
  def set_user
    @user = User.find(params[current_user.id])
  end
end
