describe RakeSharedContext do
  describe '.root_dir' do
    after do
      RakeSharedContext.instance_variable_set(:@root_dir, nil)
    end

    context '`.root_dir=` was executed before' do
      it 'should return the root_dir' do
        RakeSharedContext.root_dir = 'foo'
        expect(RakeSharedContext.root_dir).to eq Pathname.new('foo')
      end
    end

    context '`.root_dir=` was not executed before' do
      context 'Rails.root is defined' do
        before { Rails = double('Rails', root: 'rails') }
        after { Object.send(:remove_const, :Rails) }

        it 'should return `Rails.root`' do
          expect(RakeSharedContext.root_dir).to eq 'rails'
        end
      end

      context 'Padrino.root is defined' do
        before { Padrino = double('Padrino', root: 'padrino') }
        after { Object.send(:remove_const, :Padrino) }

        it 'should return `Padrino.root`' do
          expect(RakeSharedContext.root_dir).to eq 'padrino'
        end
      end

      context 'nothing is defined' do
        it 'should return current directory' do
          expect(RakeSharedContext.root_dir).to eq Pathname.pwd
        end
      end
    end
  end
end
