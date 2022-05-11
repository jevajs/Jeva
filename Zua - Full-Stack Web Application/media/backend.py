from manim import *
import numpy as np
# animations: https://azarzadavila-manim.readthedocs.io/en/stable/animation.html


class SquareToCircle(Scene):
    def construct(self):
        self.camera.background_color = "#131e29"
        
        dataFlowTxt = Text("Data Flow", font_size=30).center()
        self.play(Write(dataFlowTxt, run_time=2))  # show text
        
        self.play(FadeOut(dataFlowTxt))  # hide text
        frontend = Square(side_length=3).scale(0.5)
        frontend.set_fill(PURPLE, opacity=0.2)  # set color and transparency

        self.play(Create(frontend))
        subtitle = Text("Client", font_size=23).next_to(frontend)
        self.play(FadeIn(subtitle))
        self.play(subtitle.animate.scale(1.5).move_to(frontend))
        frontendPairing = Group(frontend, subtitle)
        self.play(frontendPairing.animate.move_to(UP*2))
          # Dialog queue (for client explanation)
        backend = Circle(radius=1.05).scale(0.75)
        backend.set_fill(RED_E, opacity=0.2)
        self.play(Create(backend))
        
        subtitle2 = Text("Server", font_size=23).next_to(backend)
        self.play(FadeIn(subtitle2))
        self.play(subtitle2.animate.scale(1.25).move_to(backend))
        backendPairing = Group(backend, subtitle2)
        self.play(backendPairing.animate.move_to(ORIGIN).move_to(DOWN*2))
          # Dialog queue 2 (for server explanation)
        ###############
        request = Arrow(frontendPairing.get_edge_center(DOWN), backendPairing.get_edge_center(
            UP), buff=25, stroke_width=2.5).set_fill(RED, opacity=1)
        response = Arrow(backendPairing.get_edge_center(UP), frontendPairing.get_edge_center(
            DOWN), buff=25, stroke_width=2.5).set_fill(PURPLE, opacity=1)
        self.play(FadeIn(request))
        bRequest = Brace(request, RIGHT, buff=1).scale(0.8)
        reqText = Text("Request").next_to(
            bRequest).scale(0.5).set_color(RED)
        reqBrace = Group(bRequest, reqText)
        self.play(FadeIn(reqBrace))
          # client first makes a *REQUEST* to the server
        self.play(FadeTransform(request, response))
        bResponse = Brace(response, RIGHT, buff=1).scale(0.8)
        resText = Text("Response").next_to(
            bResponse).scale(0.5).set_color(PURPLE)
        resBrace = Group(bRequest, resText)
        self.play(FadeOut(reqBrace))
        self.play(FadeIn(resBrace))
        # the server then sends a *RESPONSE* back to the client who originally asks for it
        
        self.play(FadeOut(resBrace), FadeOut(response, shift=UP))
        

        clientText = Text("Website (frontend)",
                          font_size=23).move_to(subtitle, aligned_edge=LEFT).move_to(np.array([-1, 0.5, 0])*4)
        serverText = Text('API Webserver (backend)',
                          font_size=23).next_to(subtitle2, aligned_edge=LEFT).move_to(np.array([-1, -0.5, 0])*4)
        self.play(FadeTransform(subtitle, clientText))
        
        self.play(FadeTransform(subtitle2, serverText))
        
        reqText2 = MarkupText("<u>GET</u> Request").next_to(
            bRequest).scale(0.5).set_color(RED)
        self.play(FadeIn(request, shift=DOWN), FadeIn(reqText2, shift=LEFT))
        
        jsonData = '''// Data from server:
{ 
    Response: [
        { 
            author: 'Zua', 
            message: 'Hello world!' 
        },
        { 
            author: 'Z', 
            message: 'Welcome everyone!' 
        }
    ]
}
        '''
        resText2 = Code(code=jsonData, language="JavaScript", font="monospace", corner_radius=0.09, tab_width=4, background="window").next_to(
            bRequest).scale(0.55).move_to(np.array([4, 0, 0]))
        self.play(FadeTransform(request, response), FadeOut(
            reqText2, shift=RIGHT), FadeIn(resText2, shift=LEFT))
        self.play(FadeOut(resText2), FadeOut(response))
        self.wait(5)
        
