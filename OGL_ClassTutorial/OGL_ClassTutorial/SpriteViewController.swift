//
//  ViewController.swift
//  OGL_ClassTutorial
//
//  Created by u0844210 on 3/29/17.
//  Copyright © 2017 cs4530. All rights reserved.
//

import GLKit

class SpriteViewController: GLKViewController {

    private var time: Float = 0
    private var translateX = 0
    private var translateY = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        glkView.context = EAGLContext(api: .openGLES2)
        
//        let vertexShaderPath: String = Bundle.main.path(forResource: "vertex", ofType: "glsl")
//        let vertexShaderSource: NSString = NSString(contentsOfFile: vertexShaderPath, encoding: String.Encoding.utf8)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private var glkView: GLKView {
        return view as! GLKView
    }
    
    
    override func glkView(_ view: GLKView, drawIn rect: CGRect) {
        glClearColor(0.5, 0.5, 0.5, 1.0)
        glClear(GLbitfield(GL_COLOR_BUFFER_BIT))
        
        
        
        let quad: [Float] = [
            // PT1
            1.0, 0.0, // Pos(x, y)
            1.0, 0.0, 0.0, 1.0, // Color (rgba)
            1.0, 0.0, //Texture Infro (x, y)
            
            0.0, 0.0,
            0.0, 1.0, 0.0, 1.0,
            
            1.0, 1.0,
            0.0, 0.0, 0.0, 1.0,
            
            0.0, 1.0,
            1.0, 0.5, 0.0, 1.0
        ]
        
        glVertexAttribPointer(0, 2, GLenum(GL_FLOAT), GLboolean(GL_FALSE), 24, quad)
        //glUniform2f(glGetUniformLocation(program, "translate"), translateX, translateY)
    }
}

