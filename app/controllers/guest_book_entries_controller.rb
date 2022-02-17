class GuestBookEntriesController < ApplicationController

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Guest Book", :guest_book_entries_path

  before_action :set_guest_book_entry, only: [:show, :edit, :update, :destroy]

  def index
    @guest_book_entries = GuestBookEntry.all
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @guest_book_entries}
    end
  end

  def show
    add_breadcrumb @guest_book_entry.title.to_s, guest_book_entries_path
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @guest_book_entry}
    end
  end

  def new
    @guest_book_entry = GuestBookEntry.new
  end

  def edit
  end

  def update
    if @guest_book_entry.update(guest_book_entry_params)
      redirect_to @guest_book_entry
    else
      respond_to do |format|
        format.html { render :edit}
        format.json { render :json => @guest_book_entry}
      end
    end
  end

  def create
    @guest_book_entry = GuestBookEntry.new(guest_book_entry_params)
    respond_to do |format|
      if @guest_book_entry.save
        format.html { redirect_to @guest_book_entry, notice: 'Entry was successfully created.' }
        format.json { render :show, status: :created, location: @guest_book_entry }
      else
        format.html { render :new }
        format.json { render json: @guest_book_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @guest_book_entry.destroy
    respond_to do |format|
      format.html { redirect_to guest_book_entries_url, notice: 'Entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_guest_book_entry
    @guest_book_entry = GuestBookEntry.find(params[:id])
  end

  def guest_book_entry_params
    params.require(:guest_book_entry).permit(:title,
                                             :body,
                                             :image_one_url,
                                             :image_one_url_cache,
                                             :image_two_url,
                                             :image_two_url_cache,
                                             :image_three_url,
                                             :image_three_url_cache,
                                             :guest_email, :guest_name,
                                             :challenge_passed,
                                             :admin_state)
  end

end
