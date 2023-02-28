require 'gnuplot'


def plotPoints(points,p1,p2)
  if p1[0].length==3
    Gnuplot.open do |gp|
      Gnuplot::SPlot.new(gp) do |plot|
        plot.grid
        plot.xrange "[-1000:1000]"
        plot.yrange "[-1000:1000]"
        plot.zrange "[-1000:1000]"
        plot.xtics 250
        plot.ytics 250
        plot.ztics 250
        x=points.clone
        x.map{|item| item[0][0]}
        y=points.clone
        y.map{|item| item[0][1]}
        z=points.clone
        z.map{|item| item[0][2]}
        plot.xlabel "x"
        plot.ylabel "y"
        plot.zlabel "z"
        plot.data<<Gnuplot::DataSet.new([x,y,z]) do |ds|
          ds.with="points ps 1 pt 7 lc rgb 'blue'"
          ds.notitle
        end
        x2=[p1[0][0],p2[0][0]]
        y2=[p1[0][1],p2[0][1]]
        z2=[p1[0][2],p2[0][2]]
        plot.data<<Gnuplot::DataSet.new([x2,y2,z2]) do |ds1|
          ds1.with="points ps 1 pt 7 lc rgb 'red'"
          ds1.title= 'closest pair'
        end
      end
    end
    elsif p1[0].length==2
    Gnuplot.open do |gp|
      Gnuplot::Plot.new(gp) do |plot|
        plot.grid
        plot.xrange "[-1000:1000]"
        plot.yrange "[-1000:1000]"
        plot.xtics 250
        plot.ytics 250
        x=points.clone
        x.map{|item| item[0][0]}
        y=points.clone
        y.map{|item| item[0][1]}
        plot.xlabel "x"
        plot.ylabel "y"
        plot.data<<Gnuplot::DataSet.new([x,y]) do |ds|
          ds.with="points ps 1 pt 7 lc rgb 'blue'"
          ds.notitle
        end
        x2=[p1[0][0],p2[0][0]]
        y2=[p1[0][1],p2[0][1]]
        plot.data<<Gnuplot::DataSet.new([x2,y2]) do |ds1|
          ds1.with="points ps 1 pt 7 lc rgb 'red'"
          ds1.title= 'closest pair'
        end
      end
    end
  end
end

