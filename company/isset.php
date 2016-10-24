<?php

class Post
{

			public $name = '123213';
	    protected $attributes = ['content' => 'foobar'];

			    public function __get($key)
					 {
									        if (isset($this->attributes[$key])) {
														            return $this->attributes[$key];																				        }
				 
					 }
			 /* function __isset($key) */
				    /* { */
							        /* if (isset($this->attributes[$key])) { */
												            /* return true; */
																		        /* } */

											        /* return false; */
											    /* } */

}

$post = new Post();
echo isset($post->content); 
echo isset($post->name);// fals
?>
