class AboutController < ApplicationController

  def information
    if request.url != about_information_url
      redirect_to about_information_url
    end
  end

  def officers
    require 'pathname'
    
    @execs = [['Jeff Tsui', 'Chair'], ['Noel Moldvai', 'External VP'], ['Ayushi Samaddar', 'Internal VP'], ['Guillaume Bellegarda', 'Treasurer'], ['Annie Shin', 'Secretary']]
    @activities = ['Alice Lee', 'Rohan Sachdev', 'Krishna Parashar', 'Ino Samaras', 'Lori Krakirian', 'William Ku', 'Leland Au']
    @hope = ['Jeff Lievense', 'Andrew Wun', 'James Yang', 'Rishi Sharma', 'Gokul Ramesh', 'Rongchang Lei', 'Ronald Lee']
    @indrel = ['Vikram Iyer', 'Harrison Tsai', 'Marion Halim', 'Jamshed Vesuna', 'Luca Zuccarini', 'Kevin Chian', 'Jonathan Hsu']
    @io = ['Flora Dai', 'Lauren Janney', 'Tabitha King', 'Ingrid Hong', 'Sihyung Kim', 'Dorothy Jung']
    @prodev = ['Skyler Rojas', 'Michael Romain', 'Parul Singh', 'Paymon Payamipour', 'Colin Elder', 'Nate Holland']
    @techops = ['Eugene Wong',  'Preetum Nakkiran', 'Harish Shanker', 'Eric Wu', 'Tom McCormick', 'Alex Romano', 'Felix Wong']
    @website = ['Yuval Gnessin', 'Pranava Adduri', 'Kevin Sheng', 'David Su', 'Anuvind Menon', 'Eleane Jao', 'Jimmy Wu']
  end

  def advisor
  end

  def contact
  end

end
