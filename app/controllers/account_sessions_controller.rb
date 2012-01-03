# -*- coding: utf-8 -*-
class AccountSessionsController < ApplicationController
#  layout 'account'

  def new
    @account_session = AccountSession.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @account }
    end
  end

  def create
    @account_session = AccountSession.new(params[:account_session])
    if @account_session.save
      flash[:notice] = "ログインしました。"
      redirect_back_or_default account_url(current_account)
    else
      flash[:notice] = "ログインに失敗しました。"
      render :action => :new
    end
  end

  def destroy
    current_account_session.destroy
    flash[:notice] = "ログアウトしました。"
    redirect_back_or_default new_account_session_url
  end
end
