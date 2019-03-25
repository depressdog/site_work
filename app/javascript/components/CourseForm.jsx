import React from 'react'

class CourseForm extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            category_id: '',
            categories: [],
            subcategory_id: '',
            subcategories: [],
    		subsubcategories: []
        };
        this.catChange = this.catChange.bind(this);
        this.subCatChange = this.subCatChange.bind(this);
    }

    catChange(e){
        this.setState({category_id: e.target.value});
        this.getSubCat(this.state.category_id);
    }
    subCatChange(e){
        this.setState({subcategory_id: e.target.value});
        this.getSubSubCat(this.state.subcategory_id);
    }

    componentDidMount(){
        fetch('/api/v1/categories')
            .then((response) => {return response.json()})
            .then((data) => {this.setState({ categories: data }) });
    }
    getSubCat(e){
        fetch('/api/v1/subcategories/' + e )
            .then((response) => {return response.json()})
            .then((data) => {this.setState({ subcategories: data }) });
    }
    getSubSubCat(e){
        fetch('/api/v1/subsubcategories/' + e )
            .then((response) => {return response.json()})
            .then((data) => {this.setState({ subsubcategories: data }) });
    }
    render(){
      const category = this.state.categories.map((category) => {
          return(<option key={category.id} value={category.id}  >{category.name}</option>)
      });
      const subcategories = this.state.subcategories.map((subcategory) => {
  			return(<option key={subcategory.id} value={subcategory.id}>{subcategory.name}</option>)
  		});
      const subsubcategory = this.state.subsubcategories.map((subsubcategory) => {
  			return(<option key={subsubcategory.id} value={subsubcategory.id}>{subsubcategory.name}</option>)
  		});
        console.log(this.state.category_id);
        return(
            <div className="three fields">
              <select onChange={this.catChange} name="course[category_id]" id="course_category_id" >
                  <option  value="">Выбор категории</option>
                  {category}
              </select>
              <select onChange={this.subCatChange} name="course[subcategory_id]" id="course_subcategory_id">
                <option value="">Выбор подкатегории</option>
                {subcategories}
                {}
              </select>
              <select name="course[subsubcategory_id]" id="course_subsubcategory_id">
                <option value="">Choose a category</option>
                {subsubcategory}
              </select>
            </div>
        )
    }
}

export default CourseForm
