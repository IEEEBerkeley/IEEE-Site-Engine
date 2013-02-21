class AboutController < ApplicationController

  def information
    if request.url != about_information_url
      redirect_to about_information_url
    end
  end

  def officers
    @execs = [['Jeff Tsui', 'Chair'], ['Noel Moldvai', 'External VP'], ['Ayushi Samaddar', 'Internal VP'], ['Guillaume Bellegarda', 'Treasurer'], ['Annie Shin', 'Secretary']]
    @activities = ['Alice Lee', 'Rohan Sachdev', 'Krishna Parashar', 'Ino Samaras', 'Lori Krakirian', 'William Ku', 'Leland Au']
    @hope = ['Jeff Lievense', 'Andrew Wun', 'James Yang', 'Rishi Sharma', 'Gokul Ramesh', 'Rongchang Lei', 'Ronald Lee']
    @indrel = ['Vikram Iyer', 'Harrison Tsai', 'Marion Halim', 'Jamshed Vesuna', 'Luca Zuccarini', 'Kevin Chian', 'Jonathan Hsu']
    @io = ['Flora Dai', 'Lauren Janney', 'Tabitha King', 'Ingrid Hong', 'Sihyung Kim', 'Dorothy Jung']
    @prodev = ['Skyler Rojas', 'Michael Romain', 'Parul Singh', 'Paymon Payamipour', 'Colin Elder', 'Nate Holland']
    @techops = ['Eugene Wong',  'Preetum Nakkiran', 'Harish Shanker', 'Eric Wu', 'Tom McCormick', 'Alex Romano', 'Felix Wong']
    @website = ['Yuval Gnessin', 'Pranava Adduri', 'Kevin Sheng', 'David Su', 'Anuvind Menon', 'Eleane Jao', 'Jimmy Wu']
	
#	 @activities = ['Sean Soleyman', 'Alice Lee', 'Ino Samaras', 'Leland Au', 'Michael Chen', 'Rohan Sachdev', 'Mano Pagalavan']
#    @hope = ['Jeff Lievense', 'Andrew Wun', 'Milad Bayan', 'Rongchang Lei', 'James Yang']
#    @indrel = ['Vikram Iyer', 'Jonathan Hsu', 'Marion Halim', 'Kevin Chian', 'Jamshed Vesuna', 'Harrison Tsai', "Alton Zheng"]
#    @io = ['Nate Holland', 'Lauren Janney', 'Flora Dai', 'Anthony Sutardja', 'Tabitha King']
#    @prodev = ['Skyler Rojas', 'Parul Singh', 'Michael Romain', 'Andrew Qin', 'Yerin Kim']
#    @techops = ['Felix Wong',  'Alex Romano', 'William Ku', 'Nelson Zhang', 'Eugene Wong']
#    @website = ['Kevin Sheng', 'Yuval Gnessin', 'Tom McCormick', 'Steve Yadlowsky', 'Jessika Wu', 'David Su']

#    @execs = [['Tianbo Xu', 'Chair'], ['Pranava Adduri', 'External VP'], ['Mark Hettick', 'Internal VP'], ['Gabe Fierro', 'Secretary'], ['Jeff Tsui', 'Treasurer']]
#    @activities = ['Leland Au', 'Alice Lee', 'Amanda Ren', 'Annie Shin', 'Edward Wu']
#    @hope = ['Sean Soleyman', 'Oliver Zhu', 'Andrew Wun']
#    @indrel = ['Mihir Joshi', 'Benjamin Lui', 'Noel Moldvai', 'Amudhan Venkatesan', 'Mano Pagalavan']
#    @io = ['Jaclyn Louie', 'Navin Eluthesen', 'Ayushi Samaddar', 'Jessika Wu', 'Muller Zhang']
#    @prodev = ['Owen Lin', 'Deirdre Chen', 'Aime Ngongang', 'Jeremy Williams']
#    @techops = ['Felix Wong', 'Guillaume Bellegarda', 'Sergio Hidalgo', 'Jonathan Hsu', 'William Ku', 'Sam Whitlock']
#    @website = ['Kristine Chen', 'Jian P. Chen', 'Stephanie Chou', 'Yuval Gnessin', 'Kevin Sheng', 'David Su']
  end

  def advisor
  end

  def contact
  end

end
