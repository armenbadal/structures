
input boxes
%input TEX

outputtemplate := "struc-fig-%c.eps";
prologues := 3;

%
%
def nodecell(expr s, w, h) =
  draw s -- s shifted(0, h) -- s shifted (w, h) 
    -- s shifted (w, 0) -- cycle;
  draw s shifted (0.5w,0) -- s shifted (0.5w, h);
enddef;
def nodebase(expr s, w, h)(text e) =
  nodecell(s, w, h);
  drawarrow s shifted (0.75w,0.5h) -- s shifted (1.5w, 0.5h);
  label(e, s shifted (0.25w, 0.5h));
enddef;
%
% +-+------+-+
% | |      | |
% +-+------+-+
def dnodecell(expr s, w, h) =
  draw s -- s shifted(0, h) -- s shifted (w, h) 
    -- s shifted (w, 0) -- cycle;
  draw s shifted (0.25w,0) -- s shifted (0.25w, h);
  draw s shifted (0.75w,0) -- s shifted (0.75w, h);
enddef;
def dnodebase(expr s, w, h)(text e) =
  dnodecell(s, w, h);
  label(e, s shifted (0.5w, 0.5h));
  drawarrow s shifted (0.15w,0.7h) -- s shifted (-0.5w, 0.7h);
  drawarrow s shifted (0.85w,0.3h) -- s shifted (1.5w, 0.3h);
enddef;

%
%
def node(expr s)(text e) = nodebase(s, 40, 16)(e); enddef;
%
def dnode(expr s)(text e) = dnodebase(s, 40, 16)(e); enddef;
%
%
def nodenil(expr s, w) =
  draw s -- s shifted (0,w) -- s shifted (w,w)
    -- s shifted (w,0) -- s -- s shifted (w,w); 
enddef;

%
%
vardef vertex@#(text s)(expr e)=
  circleit@#(s); @#.c=e; drawboxed(@#)
enddef;
%
%
def edge(suffix a)(suffix b) =
  draw a.c -- b.c cutbefore bpath a cutafter bpath b
enddef;

%ahlength:=3bp;
ahangle:=36;

%
% հանգույց
%
beginfig(1);
  node((0,0))(btex \strut etex);
  label.top(btex {\it data} etex, (0,16));
  label.top(btex {\it next} etex, (40,16));
endfig;

%
% միակապ ցուցակի օրինակ
%
beginfig(2);
  label.lft(btex {\it head} etex, (5,18));
  drawarrow (5,18)--(20,18);
  node((20,10))(btex $a_0$ etex);
  node((80,10))(btex $a_1$ etex);
  node((140,10))(btex $a_3$ etex);
  node((200,10))(btex $a_4$ etex);
  nodenil((260,10), 16);
endfig;


%
%
beginfig(8);
  % հեռացնելը
  label("...", (25, 8));
  drawarrow (30,8) -- (40,8);
  nodecell((40, 0), 40, 16);
  drawarrow (50,-10) -- (50,0);
  label(btex {\it p} etex, (50,-15));
  nodecell((100, 10), 40, 16);
  nodecell((160, 0), 40, 16);
  drawarrow (190,8) -- (210,8);
  label("...", (215, 8));
  drawarrow (70,10){dir 30} .. (100,18) dashed evenly;
  drawarrow (130,18){dir 0} .. (160,10) dashed evenly;
  drawarrow (70,6){dir -20} .. (160,6);
  label(btex {\it p.next := p.next.next} etex, (120,-15));

  % մինչև հեռացնելը
  label("...", (25, 58));
  drawarrow (30,58) -- (40,58);
  nodecell((40, 50), 40, 16);
  drawarrow (50,40) -- (50,50);
  label(btex {\it p} etex, (50,35));
  drawarrow (70,58) -- (100,58);
  nodecell((100, 50), 40, 16);
  drawarrow (130,58) -- (160,58);
  nodecell((160, 50), 40, 16);
  drawarrow (190,58) -- (210,58);
  label("...", (215, 58));
endfig;

%
%
beginfig(9);
  numeric r;
  % 1
  r := 200;
  % շրջված մաս
  label("...", (12, r+8));
  nodecell((40,r), 40, 16);
  drawarrow (50,r+8) -- (20,r+8);
  drawarrow (50,r-10) -- (50,r);
  label(btex {\it q} etex, (50,r-16));
  % դեռ չշրջված մաս
  nodecell((110,r), 40, 16);
  drawarrow (140,r+8) -- (170,r+8);
  drawarrow (120,r-10) -- (120,r);
  label(btex {\it p} etex, (120,r-16));
  nodecell((170,r), 40, 16);
  drawarrow (200,r+8) -- (230,r+8);
  nodenil((230,r), 16);
  % 2
  r := 150;
  % շրջված մաս
  label("...", (12, r+8));
  nodecell((40,r), 40, 16);
  drawarrow (50,r+8) -- (20,r+8);
  drawarrow (50,r-10) -- (50,r);
  label(btex {\it q} etex, (50,r-16));
  % դեռ չշրջված մաս
  nodecell((110,r), 40, 16);
  %%drawarrow (140,r+8) -- (170,r+8);
  drawarrow (140,r+8){dir 20} ..{dir 220}(80,r+8);
  drawarrow (120,r-10) -- (120,r);
  label(btex {\it p} etex, (120,r-16));
  nodecell((170,r), 40, 16);
  drawarrow (200,r+8) -- (230,r+8);
  drawarrow (180,r-10) -- (180,r);
  label(btex {\it r} etex, (180,r-16));
  nodenil((230,r), 16);
endfig;

%
%
beginfig(11);
  dnode((40,0))(btex \strut etex);
  label.top(btex {\it data} etex, (60,16));
  label.top(btex {\it next} etex, (100,8));
  label.top(btex {\it previous} etex, (15,12));
endfig;

%
%
beginfig(12);
  nodenil((10,6), 10);
  dnode((40,0))(btex $a_0$ etex);
  dnode((100,0))(btex $a_1$ etex);
  dnode((160,0))(btex $a_2$ etex);
  dnode((220,0))(btex $a_3$ etex);
  nodenil((280,0), 10);
  drawarrow (60, 30) -- (60, 16);
  label.top(btex {\it head} etex, (60,30));
  drawarrow (240, 30) -- (240, 16);
  label.top(btex {\it tail} etex, (240,30));
endfig;

%
%
beginfig(13);
  % 1
  % ցուցակ
  dnodecell((100,20), 40, 16);
  label(btex $a_0$ etex, (120,28));
  drawarrow (105,32) -- (90,32);
  nodenil((84,29), 6);
  drawarrow (135,24) -- (150,24);
  drawarrow (150,32) -- (140,32);
  label("...", (156,28));
  drawarrow (120,46) -- (120,36);
  label.top(btex {\it head} etex, (120,46));
  % նոր հանգույց
  dnodecell((20,20), 40, 16);
  label(btex $e$ etex, (40,28));
  drawarrow (25,32) -- (10,32);
  nodenil((4,29), 6);
  drawarrow (55,24) -- (70,24);
  nodenil((70,21), 6);
  drawarrow (40,46) -- (40,36);
  label.top(btex {\it nno} etex, (40,46));
  % 2
  % ցուցակ
  dnodecell((300,20), 40, 16);
  label(btex $a_0$ etex, (320,28));
  drawarrow (305,32) -- (290,32);
  drawarrow (335,24) -- (350,24);
  drawarrow (350,32) -- (340,32);
  label("...", (356,28));
  drawarrow (270,46) -- (270,36);
  label.top(btex {\it head} etex, (270,46));
  % նոր հանգույց
  dnodecell((250,20), 40, 16);
  label(btex $e$ etex, (270,28));
  drawarrow (255,32) -- (240,32);
  nodenil((234,29), 6);
  drawarrow (285,24) -- (300,24);
  drawarrow (250,46) -- (266,36) dashed evenly;
  label.top(btex {\it nno} etex, (245,46));
endfig;

%
%
beginfig(14);
  % 1
  % ցուցակ
  dnodecell((30,20), 40, 16);
  label(btex $a_n$ etex, (50,28));
  drawarrow (35,32) -- (20,32);
  drawarrow (20,24) -- (30,24);
  drawarrow (65,24) -- (80,24);
  nodenil((80,21), 6);
  label("...", (14,28));
  drawarrow (50,46) -- (50,36);
  label.top(btex {\it tail} etex, (50,46));
  % նոր հանգույց
  dnodecell((110,20), 40, 16);
  label(btex $e$ etex, (130,28));
  drawarrow (115,32) -- (100,32);
  nodenil((94,29), 6);
  drawarrow (145,24) -- (160,24);
  nodenil((160,21), 6);
  drawarrow (130,46) -- (130,36);
  label.top(btex {\it nno} etex, (130,46));
  % 2
  % ցուցակ
  dnodecell((260,20), 40, 16);
  label(btex $a_n$ etex, (280,28));
  drawarrow (265,32) -- (250,32);
  drawarrow (250,24) -- (260,24);
  drawarrow (295,24) -- (310,24);
  label("...", (244,28));
  drawarrow (330,46) -- (330,36);
  label.top(btex {\it tail} etex, (330,46));
  % նոր հանգույց
  dnodecell((310,20), 40, 16);
  label(btex $e$ etex, (330,28));
  drawarrow (315,32) -- (300,32);
  drawarrow (345,24) -- (360,24);
  nodenil((360,21), 6);
  drawarrow (350,46) -- (336,36) dashed evenly;
  label.top(btex {\it nno} etex, (354,46));
endfig;

%
%
beginfig(15);
  label("...", (4,8));
  % 1
  dnodecell((20,0), 40, 16); 
  label(btex $a_i$ etex, (40,8));
  drawarrow (25,12) -- (10,12);
  drawarrow (10,4) -- (20,4);
  % 2
  dnodecell((80,0), 40, 16); 
  label(btex $a_e$ etex, (100,8));
  % 3
  dnodecell((140,0), 40, 16); 
  label(btex $a_j$ etex, (160,8));
  drawarrow (190,12) -- (180,12);
  drawarrow (175,4) -- (190,4);
  label("...", (196,8));
  % հին կապերը
  drawarrow (55,4) -- (80,4) dashed evenly;
  drawarrow (85,12) -- (60,12);
  drawarrow (115,4) -- (140,4);
  drawarrow (145,12) -- (120,12) dashed evenly;
  % նոր կապերը
  drawarrow (55,2){dir -16} .. (140,2);
  drawarrow (145,14){dir 164} .. (60,14);
endfig;

%
%
beginfig(21);
  circleit.bo(btex \strut etex);
  bo.c=(40,40); drawboxed(bo);
  drawarrow (40,40)--(20,20) cutbefore bpath bo;
  drawarrow (40,40)--(60,20) cutbefore bpath bo;
  label.top(btex {\it data} etex, bo.n);
  label.lft(btex {\it left} etex, (20,20));
  label.rt(btex {\it right} etex, (60,20));
endfig;


%
vardef nilbox(suffix $)(expr e) =
  pair $.s;
  $.s=e shifted (0,3);
  e shifted (-3,-3) -- e shifted (-3,3)
        -- e shifted (3,3) -- e shifted (3,-3)
        -- e shifted (-3,-3) -- e shifted (3,3) 
enddef;

%
beginfig(22);
  numeric dx, dy;
  dx=12; dy=20;

  draw nilbox(aa, (0,0));
  draw nilbox(ab, (2dx,0));
  vertex.ca(btex $a_0$ etex)((dx,dy));
  draw ca.c--aa.s cutbefore bpath ca;
  draw ca.c--ab.s cutbefore bpath ca;

  draw nilbox(ac, (4dx,0));
  draw nilbox(ad, (6dx,0));
  vertex.cb(btex $a_2$ etex)((5dx,dy));
  draw cb.c--ac.s cutbefore bpath cb;
  draw cb.c--ad.s cutbefore bpath cb;

  vertex.cd(btex $a_1$ etex)((3dx,2dy));
  edge(cd, ca);
  edge(cd, cb);

  draw nilbox(af, (12dx,0));
  draw nilbox(ag, (14dx,0));
  vertex.cg(btex $a_5$ etex)((13dx,dy));
  draw cg.c--af.s cutbefore bpath cg;
  draw cg.c--ag.s cutbefore bpath cg;

  draw nilbox(ae, (9dx,dy));
  vertex.cf(btex $a_4$ etex)((11dx,2dy));
  draw cf.c--ae.s cutbefore bpath cf;
  edge(cf, cg);

  vertex.ce(btex $a_3$ etex)((7dx,3dy));
  edge(ce, cd);
  edge(ce, cf);
endfig;

%
%
beginfig(23);
  numeric w, h, s;
  w:=20; h:=24; s:=160;
  % 1
  % հանգույցներ
  vertex.m_a(btex $a_0$ etex)((0,2h));
  vertex.m_b(btex $a_1$ etex)((w,h));
  vertex.m_c(btex $a_2$ etex)((2w,3h));
  vertex.m_d(btex $a_3$ etex)((3w,h));
  vertex.m_f(btex $a_4$ etex)((4w,2h));
  vertex.m_g(btex $a_5$ etex)((5w,h));
  %
  edge(m_a, m_b);
  edge(m_c, m_a);
  edge(m_c, m_f);
  edge(m_f, m_d);
  edge(m_f, m_g);
  %
  drawarrow m_c.n shifted (0,10) -- m_c.n;
  % 2
  % հանգույցներ
  vertex.n_a(btex $a_0$ etex)((s+0,2h));
  vertex.n_b(btex $a_1$ etex)((s+w,h));
  vertex.n_c(btex $a_2$ etex)((s+2w,3h));
  vertex.n_d(btex $a_3$ etex)((s+3w,h));
  vertex.n_e(btex $\;e\;$ etex)((s+4w,0));
  vertex.n_f(btex $a_4$ etex)((s+5w,2h));
  vertex.n_g(btex $a_5$ etex)((s+6w,h));
  % կողեր
  edge(n_a, n_b);
  edge(n_c, n_a);
  edge(n_c, n_f) withpen pencircle scaled 1.2pt;
  edge(n_f, n_g);
  edge(n_f, n_d) withpen pencircle scaled 1.2pt;
  edge(n_d, n_e) withpen pencircle scaled 1.2pt;
  % արմատի նիշ
  drawarrow n_c.n shifted (0,10) -- n_c.n;
endfig;

%
%
def subtree(expr e)(text s) =
  draw  e -- e shifted (-16,-28) 
  -- e shifted (16, -28) -- cycle;
  label(s, e shifted (0,-.6*28))
enddef;

%
%
beginfig(24);
  numeric w;
  % i
  w:=40;
  label(btex {\bf i} etex, (w-12, 44));
  vertex.nno(btex $\;e\;$ etex)((w,30));
  draw nno.c--(w-20,10) cutbefore bpath nno;
  nodenil((w-23,4), 6);
  draw nno.c--(w+20,10) cutbefore bpath nno;
  nodenil((w+17,4), 6);
  % ii
  w:=110;
  label(btex {\bf ii} etex, (w-12, 44));
  vertex.nni(btex $\;e\;$ etex)((w,30));
  draw nni.c--(w-20,10) cutbefore bpath nni;
  subtree((w-20,10))(btex $L$ etex);
  draw nni.c--(w+20,10) cutbefore bpath nni;
  nodenil((w+17,4), 6);
  % iii
  w:=180;
  label(btex {\bf iii} etex, (w-12, 44));
  vertex.nnii(btex $\;e\;$ etex)((w,30));
  draw nnii.c--(w-20,10) cutbefore bpath nnii;
  nodenil((w-23,4), 6);
  draw nnii.c--(w+20,10) cutbefore bpath nnii;
  subtree((w+20,10))(btex $R$ etex);
  % iv
  w:=270;
  label(btex {\bf iv} etex, (w-12, 44));
  vertex.nniii(btex $\;e\;$ etex)((w,30));
  draw nniii.c--(w-20,10) cutbefore bpath nniii;
  subtree((w-20,10))(btex $L$ etex);
  draw nniii.c--(w+20,10) cutbefore bpath nniii;
  subtree((w+20,10))(btex $R$ etex);
endfig;

%
beginfig(25);
  numeric dx, dy;
  dx := 14; dy := 26;

  % սկզբնական 
  % գագաթներ
  vertex.n_a(btex $A$ etex)((0,dy));
  vertex.n_b(btex $B$ etex)((dx,2dy));
  vertex.n_c(btex $C$ etex)((2dx,dy));
  vertex.n_d(btex $D$ etex)((3dx,3dy));
  vertex.n_e(btex $E$ etex)((4dx,0));
  vertex.n_f(btex $F$ etex)((5dx,dy));
  vertex.n_g(btex $G$ etex)((6dx,2dy));
  vertex.n_h(btex $H$ etex)((7dx,0));
  vertex.n_i(btex $I$ etex)((8dx,dy));
  vertex.n_j(btex $J$ etex)((9dx,0));
  % կողեր
  edge(n_d,n_b);
  edge(n_b,n_a);
  edge(n_b,n_c);
  edge(n_d,n_g);
  edge(n_g,n_f);
  edge(n_g,n_i);
  edge(n_f,n_e);
  edge(n_i,n_h);
  edge(n_i,n_j);

  % փոփոխված. հեռացված է E֊ն
  numeric sh;
  sh = 200;
  % գագաթներ
  vertex.m_a(btex $A$ etex)((sh+0,dy));
  vertex.m_b(btex $B$ etex)((sh+dx,2dy));
  vertex.m_c(btex $C$ etex)((sh+2dx,dy));
  vertex.m_e(btex $E$ etex)((sh+3dx,3dy));
  vertex.m_f(btex $F$ etex)((sh+5dx,dy));
  vertex.m_g(btex $G$ etex)((sh+6dx,2dy));
  vertex.m_h(btex $H$ etex)((sh+7dx,0));
  vertex.m_i(btex $I$ etex)((sh+8dx,dy));
  vertex.m_j(btex $J$ etex)((sh+9dx,0));
  % կողեր
  edge(m_e,m_b);
  edge(m_b,m_a);
  edge(m_b,m_c);
  edge(m_e,m_g);
  edge(m_g,m_f);
  edge(m_g,m_i);
  edge(m_i,m_h);
  edge(m_i,m_j);
endfig;

%
beginfig(26);
  numeric dx, dy;
  dx := 14; dy := 26;

  % փոփոխված 2. հեռացված է F֊ը
  % գագաթներ
  vertex.m_a(btex $A$ etex)((0,dy));
  vertex.m_b(btex $B$ etex)((dx,2dy));
  vertex.m_c(btex $C$ etex)((2dx,dy));
  vertex.m_e(btex $E$ etex)((3dx,3dy));
  vertex.m_g(btex $G$ etex)((5dx,2dy));
  vertex.m_h(btex $H$ etex)((6dx,0));
  vertex.m_i(btex $I$ etex)((7dx,dy));
  vertex.m_j(btex $J$ etex)((8dx,0));
  % կողեր
  edge(m_e,m_b);
  edge(m_b,m_a);
  edge(m_b,m_c);
  edge(m_e,m_g);
  edge(m_g,m_i);
  edge(m_i,m_h);
  edge(m_i,m_j);

  % փոփոխված 2. հեռացված է G֊ն
  numeric sh;
  sh = 200;
  % գագաթներ
  vertex.n_a(btex $A$ etex)((sh+0,dy));
  vertex.n_b(btex $B$ etex)((sh+dx,2dy));
  vertex.n_c(btex $C$ etex)((sh+2dx,dy));
  vertex.n_e(btex $E$ etex)((sh+3dx,3dy));
  vertex.n_h(btex $H$ etex)((sh+4dx,dy));
  vertex.n_i(btex $I$ etex)((sh+5dx,2dy));
  vertex.n_j(btex $J$ etex)((sh+6dx,dy));
  % կողեր
  edge(n_e,n_b);
  edge(n_b,n_a);
  edge(n_b,n_c);
  edge(n_e,n_i);
  edge(n_i,n_h);
  edge(n_i,n_j);
endfig;

end

