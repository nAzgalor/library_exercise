class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy take_book return_book]
  before_action :authenticate_user!, only: %i[edit update destroy crate new take_book]

  def index
    @top_5_books = Book.top_5_books
    @books = Book.all - @top_5_books
    @books = Kaminari.paginate_array(@books).page(params[:page])
  end

  def show
    @rating = Rating.new
    @mark = RatingService.new(@book).call
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def take_book
    if @book.in?
      @book.update(reader_id: current_user.id, status: 1)
      redirect_to @book, notice: 'We wish you a good time!'
    else
      redirect_to @book, notice: 'Sorry, but this book is already being read'
    end
  end

  def return_book
    if @book.out?
      @book.update(reader_id: nil, status: 0)
      redirect_to @book, notice: 'Thank you for returning the book'
    else
      redirect_to @book, notice: 'Sorry, but this book can not be returned'
    end
  end

  private

  def set_book
    @book = 
      if params[:book_id].present?
        Book.find(params[:book_id])
      else
        Book.find(params[:id])
      end
  end

  def book_params
    params.require(:book).permit(:image, :name, :description, :author, :status)
  end
end
