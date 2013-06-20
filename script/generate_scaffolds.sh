#!/bin/bash

rails g scaffold IdeaFile idea_id:integer file:string published:boolean
rails g scaffold Idea user_id:integer title:string description:text published:boolean
rails g scaffold IdeaComment user_id:integer idea_id:integer content:text published:boolean
rails g scaffold IdeaLike user_id:integer idea_id:integer
rails g scaffold Page user_id:integer title:string content:text sort_order:integer published:boolean
rails g scaffold PageItem user_id:integer title:string content:text sort_order:integer published:boolean
rails g scaffold Post user_id:integer title:string content:text published:boolean
rails g scaffold User name:string email:string password:string job_title:string phone:string technical_expertise:text email_idea_comments:boolean email_news:boolean is_admin:boolean