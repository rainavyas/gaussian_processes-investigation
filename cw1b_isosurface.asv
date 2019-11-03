% Specify mean, covariance and likelihood functions
meanfunc = [];
covfunc = @covSEiso;
likfunc = @likGauss;

% define an array of values for three log(param)
x_ = -3:0.2:5;
y_ = 0:0.2:3;
z_ = 0:0.2:3;

[X,Y,Z] = meshgrid(x_,y_,z_);

nlml_mat = zeros(length(y_), length(x_), length(z_));

counteri = 1;o
for i = y_
    counterj = 1;
    for j = x_
        counterk = 1;
        for k = z_
            hyp = struct('mean', [], 'cov', [i j], 'lik', k);
            nlml = gp(hyp, @infGaussLik, meanfunc, covfunc, likfunc, x, y);
            nlml_mat(counteri, counterj, counterk) = nlml;
            counterk = counterk + 1;
        end
        counterj = counterj +1;
    end
    counteri = counteri + 1;
end


% Plot 3D iso-surfaces of nlml
isovalue = [120, 110, 100, 90, 80, 70, 60];

p = patch(isosurface(X,Y,Z,nlml_mat, isovalue(1)));
isonormals(X,Y,Z,nlml_mat,p);
p.FaceColor = 'red';
p.EdgeColor = 'none';
%daspect([1 1 1])

q = patch(isosurface(X,Y,Z,nlml_mat, isovalue(2)));
isonormals(X,Y,Z,nlml_mat,q);
q.FaceColor = 'blue';
q.EdgeColor = 'none';

r = patch(isosurface(X,Y,Z,nlml_mat, isovalue(3)));
isonormals(X,Y,Z,nlml_mat,p);
r.FaceColor = 'green';
r.EdgeColor = 'none';

s = patch(isosurface(X,Y,Z,nlml_mat, isovalue(4)));
isonormals(X,Y,Z,nlml_mat,p);
s.FaceColor = 'magenta';
s.EdgeColor = 'none';

t = patch(isosurface(X,Y,Z,nlml_mat, isovalue(5)));
isonormals(X,Y,Z,nlml_mat,p);
t.FaceColor = 'cyan';
t.EdgeColor = 'none';

u = patch(isosurface(X,Y,Z,nlml_mat, isovalue(6)));
isonormals(X,Y,Z,nlml_mat,p);
u.FaceColor = 'black';
u.EdgeColor = 'none';

v = patch(isosurface(X,Y,Z,nlml_mat, isovalue(7)));
isonormals(X,Y,Z,nlml_mat,p);
v.FaceColor = 'yellow';
v.EdgeColor = 'none';

view(3); 
axis tight
camlight 
lighting gouraud
        

