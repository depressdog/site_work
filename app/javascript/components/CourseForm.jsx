import React from 'react'
import Category from './Category'
import SubCategory from './SubCategory'
import SubSubCategory from './SubSubCategory'

class CourseForm extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            category_id: '',
            categories: [],
            subcategories: [],
            subsubcategories: []
        };
        this.handleidChange = this.handleidChange.bind(this);
    }
    handleidChange(e){
        this.setState({ category_id: e.target.value });
        console.log(this.state.category_id)
    }
    render(){
        return(
            <div className="three fields">
                <Category/>
                <SubCategory/>
                <SubSubCategory/>
            </div>
        )
    }
}

export default CourseForm