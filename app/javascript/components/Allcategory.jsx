import React from 'react'
import Category from './Category'

class Allcategory extends React.Component {
    constructor(props){
        super(props);
        this.state = {
            categories: [],
            cat_id: props
        };
    }
    componentDidMount(){
        fetch('/api/v1/categories.json')
            .then((response) => {return response.json()})
            .then((data) => {this.setState({ categories: data }) });
    }
    render(){
        return(
            <div>
                {this.cat_id}
            </div>
        )
    }
}
export default Allcategory