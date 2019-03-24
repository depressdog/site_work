import React from 'react';

class Category extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            category_id: '',
            categories: []
        };
    }
    componentDidMount(){
        fetch('/api/v1/categories.json')
            .then((response) => {return response.json()})
            .then((data) => {this.setState({ categories: data }) });
    }
    render(){
        const category = this.state.categories.map((category) => {
            return(<option key={category.id} value={category.id}>{category.name}</option>)
        });
        return(
            <select onChange={this.handleidChange} name="course[category_id]" id="course_category_id">
                <option value="">Выбор категории</option>
                {category}
            </select>
        )
    }
}

export default Category